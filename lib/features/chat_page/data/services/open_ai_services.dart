import 'package:dart_openai/dart_openai.dart';
import 'package:debate_simulator_app/features/chat_page/presentation/model/chat_message_model.dart';

class OpenAIServices {
  // Generate Debate Prompt
  Future<String> generateDebatePrompt(String topic, String side) async {
    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: "Generate a debate prompt about \$topic supporting the \$side.",
      maxTokens: 50,
    );
    return completion.choices.first.text.trim();
  }

  Future<String> getAssistantReply(List<ChatMessage> conversation) async {
    List<OpenAIChatCompletionChoiceMessageModel> conversationHistory =
        List.generate(
            conversation.length,
            (index) => OpenAIChatCompletionChoiceMessageModel(
                  role: OpenAIChatMessageRole.user,
                  content: conversation[index].text,
                ));

    // Call GPT-3 to generate the assistant's reply.
    OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: conversationHistory,
      maxTokens: 100,
    );

    return completion.choices.last.message.content;
  }

// Define a function to evaluate the discussion and provide feedback.
  Future<String> evaluateDiscussion(List<ChatMessage> conversation) async {
    // Construct the discussion context as a single string.
    String discussionContext = conversation
        .map((entry) => "${entry.chatMessageType}: ${entry.text}")
        .join("\\n");

    // Generate a prompt for ChatGPT to evaluate the discussion.
    String prompt =
        "Evaluate the discussion and provide feedback on deficiencies and areas to learn.\\n$discussionContext";

    // Use ChatGPT to get the evaluation feedback.
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: prompt,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );

    // Extract and return the feedback provided by ChatGPT.
    return chatCompletion.choices.first.message.content;
  }
}
