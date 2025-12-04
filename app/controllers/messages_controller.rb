class MessagesController < ApplicationController
  SYSTEM_PROMPT = "You are an expert cinephile.\n\nI am a movie fan, looking for new movies to watch.\n\nHelp me find new movies with similar genres, themes or people involved in the making of those movies.\n\nAnswer concisely in Markdown."

  def create
    @chat = Chat.find(params[:chat_id])
    @movie = @chat.movie
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      @chat.messages.create(role: "assistant", content: response.content)
      destroy_old_messages

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_path(@chat) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_message_container", partial: "messages/form", locals: { chat: @chat, message: @message }) }
        format.html { render "chats/show", status: :unprocessable_entity }
      end
    end
  end

  private

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(role: message.role, content: message.content)
    end
  end

  def destroy_old_messages
    chat_length = @chat.messages.length
    amount_to_keep = 10
    if chat_length > amount_to_keep
      amount_to_destroy = chat_length - amount_to_keep
      @chat.messages[0, amount_to_destroy].each do |message|
        message.destroy
      end
    end
  end

  def movie_title
    "Here is the title of the movie: #{@movie.title}."
  end

  def movie_description
    "Here is the description of the movie: #{@movie.description}."
  end

  def instructions
    [SYSTEM_PROMPT, movie_title, movie_description].compact.join("\n\n")
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
