## Generators relevant to ollama and deepseek-coder model  


* **`ollama.OllamaGenerator`**
* **`ollama.OllamaGeneratorChat`**

Here's why and how to choose between them:

**1. `ollama.OllamaGenerator`**

* This is the basic generator for interacting with Ollama models.
* It's suitable for standard text generation and completion tasks.
* If you're primarily testing the model's ability to generate code snippets or respond to straightforward prompts, this is a good choice.

**2. `ollama.OllamaGeneratorChat`**

* This generator is specifically designed for chat-based models.
* It handles the formatting of prompts and responses in a conversational manner.
* If your `deepseek-coder` model is configured or intended to be used in a chat-like interaction, this generator is more appropriate.
* Ollama models can be run in a standard mode, or in a chat mode. This generator reflects those modes.

**How to Choose:**

* **If you're unsure, start with `ollama.OllamaGenerator`.** It's the more general-purpose option.
* **If you are running the model in chat mode within ollama, then use `ollama.OllamaGeneratorChat`.**
* Experiment with both generators to see which one produces the most relevant results for your testing.

**Example Usage:**

* **Using `ollama.OllamaGenerator`:**

    ```bash
    garak --model_type ollama --model_name deepseek-coder:1.3b --probes garak.probes.ethics.Toxicity --generators ollama.OllamaGenerator
    ```

* **Using `ollama.OllamaGeneratorChat`:**

    ```bash
    garak --model_type ollama --model_name deepseek-coder:1.3b --probes garak.probes.ethics.Toxicity --generators ollama.OllamaGeneratorChat
    ```

**Key Considerations:**

* Ensure that your Ollama server is running and that the `deepseek-coder:1.3b` model is loaded.
* Garak will send various prompts to your model based on the chosen generator and probe.
* The output that garak produces will then show the results of the model's responses to those prompts.
* If you are testing code generation, you may want to use probes that are specific to code generation vulnerabilities.

By using these ollama generators, you can effectively test your local `deepseek-coder` model with Garak.

