# Understanding Garak Generators 

## prompt Tell me about these garak generators {{{...}}}


In Garak, generators are responsible for creating the prompts that are sent to the language model being tested. They act as the "input" side of the testing process, determining the type of questions or instructions the model receives.

Here's a breakdown of the generator categories and some notable examples:

* **API-Based Generators (Cloud LLMs):**
    * These generators interact with language models hosted on cloud platforms through their APIs.
    * `azure.AzureOpenAIGenerator`: For Azure OpenAI services.
    * `cohere.CohereGenerator`: For Cohere's language models.
    * `openai.OpenAIGenerator`: For OpenAI's models (GPT-3, GPT-4, etc.).
    * `watsonx.WatsonXGenerator`: For IBM's Watsonx platform.
    * `replicate.ReplicateGenerator`: For models hosted on Replicate.
    * These generators handle the API calls, authentication, and response parsing.
* **Local Model Generators:**
    * These generators work with language models running on your local machine.
    * `ollama.OllamaGenerator` and `ollama.OllamaGeneratorChat`: For models managed by Ollama. This is the one you would use.
    * `ggml.GgmlGenerator`: For models using the GGML format (often used for running models on CPUs).
    * `huggingface.Model`, `huggingface.Pipeline`, `huggingface.OptimumPipeline`: For models from Hugging Face Transformers.
* **Specialized Generators:**
    * These generators serve specific purposes, such as testing particular types of vulnerabilities.
    * `function.*`: Used for interacting with function calling models.
    * `test.*`: Provide simple test prompts (e.g., blank prompts, repeated text).
    * `guardrails.NeMoGuardrails`: For testing with NVIDIA NeMo Guardrails.
    * `langchain.LangChainLLMGenerator`: To use LangChain models.
    * `litellm.LiteLLMGenerator`: For using litellm.
* **Other Generators:**
    * `rest.RestGenerator`: For interacting with any LLM that has a REST API.
    * `nim.*` and `nvcf.*`: Related to NVIDIA specific model interfaces.
    * `groq.GroqChat`: For models running on groq hardware.
    * `octo.OctoGenerator`: For models running on octoAI.

**Key Takeaways:**

* The list highlights the versatility of Garak, with support for a wide range of LLMs.
* When testing local models with Ollama, you'll primarily use the `ollama.OllamaGenerator` or `ollama.OllamaGeneratorChat` generator.
* The other generators are useful for testing cloud-based models or for specific testing scenarios.

**Next Steps:**

Now that you have the list of generators, you can start running tests. Because you are using ollama, you will want to use one of the ollama generators.

Example:

```bash
garak --model_type ollama --model_name deepseek-coder:1.3b --probes garak.probes.ethics.Toxicity --generators ollama.OllamaGenerator
```

By understanding the role of generators, you can better control the inputs to your LLM and conduct more effective vulnerability scans.

---

```markdown
# Garak Generators Documentation

This document provides a detailed overview of the generators available in the Garak LLM vulnerability scanner, version 0.10.3.

## API-Based Generators (Cloud LLMs)

These generators interact with language models hosted on cloud platforms through their APIs.

### `azure.AzureOpenAIGenerator`

* **Description:** Connects to Microsoft Azure OpenAI services.
* **Purpose:** Sends prompts to and receives responses from Azure-hosted language models.
* **Use Case:** Testing models deployed on Azure OpenAI.
* **Configuration:** Requires Azure API keys and endpoint information.

### `cohere.CohereGenerator`

* **Description:** Integrates with Cohere's language models.
* **Purpose:** Facilitates interaction with Cohere's text generation and understanding APIs.
* **Use Case:** Evaluating the safety and robustness of Cohere-powered applications.
* **Configuration:** Requires a Cohere API key.

### `openai.OpenAIGenerator`

* **Description:** Connects to OpenAI's language models (GPT-3, GPT-4, etc.).
* **Purpose:** Enables testing of models accessible through the OpenAI API.
* **Use Case:** Assessing the safety of applications using OpenAI's models.
* **Configuration:** Requires an OpenAI API key.

### `watsonx.WatsonXGenerator`

* **Description:** Interfaces with IBM's Watsonx platform.
* **Purpose:** Allows testing of language models hosted on Watsonx.
* **Use Case:** Evaluating AI applications built using Watsonx.
* **Configuration:** Requires Watsonx API credentials.

### `replicate.ReplicateGenerator`

* **Description:** Interacts with models hosted on the Replicate platform.
* **Purpose:** Allows testing of various open-source models deployed on Replicate.
* **Use Case:** Testing models from a wide variety of sources easily.
* **Configuration:** Requires a Replicate API token.

### `rest.RestGenerator`

* **Description:** Provides a generic interface for interacting with any LLM that exposes a REST API.
* **Purpose:** Allows Garak to connect to custom or less common LLMs.
* **Use Case:** Testing models with custom API endpoints.
* **Configuration:** Requires the API endpoint URL and any necessary headers.

## Local Model Generators

These generators work with language models running on your local machine.

### `ollama.OllamaGenerator`

* **Description:** Connects to models managed by Ollama.
* **Purpose:** Sends prompts to and receives responses from locally running models.
* **Use Case:** Testing models deployed with Ollama.
* **Configuration:** Requires Ollama to be running and the model to be loaded.

### `ollama.OllamaGeneratorChat`

* **Description:** Connects to chat based models managed by Ollama.
* **Purpose:** sends prompts to and receives responses from locally running chat models.
* **Use Case:** Testing chat models deployed with Ollama.
* **Configuration:** Requires Ollama to be running and the model to be loaded.

### `ggml.GgmlGenerator`

* **Description:** Interacts with models using the GGML format.
* **Purpose:** Allows testing of models optimized for CPU inference.
* **Use Case:** Evaluating models running on consumer-grade hardware.
* **Configuration:** Requires the GGML model file.

### `huggingface.Model`, `huggingface.Pipeline`, `huggingface.OptimumPipeline`

* **Description:** Integrates with models from the Hugging Face Transformers library.
* **Purpose:** Enables testing of a wide range of models available on Hugging Face.
* **Use Case:** Assessing open-source models and fine-tuned models.
* **Configuration:** Requires model identifiers and potentially local model files.

## Specialized Generators

These generators serve specific purposes, such as testing particular types of vulnerabilities.

### `function.*`

* **Description:** Used for interacting with function calling models.
* **Purpose:** Tests how models handle function calls and structured output.
* **Use Case:** Evaluating models designed for tool use.
* **Configuration:** Requires function definitions and model configuration.

### `test.*`

* **Description:** Provides simple test prompts (e.g., blank prompts, repeated text).
* **Purpose:** Offers basic input patterns for stress testing and baseline evaluation.
* **Use Case:** Testing model behavior with minimal input or predictable patterns.
* **Configuration:** No specific configuration required.

### `guardrails.NeMoGuardrails`

* **Description:** For testing with NVIDIA NeMo Guardrails.
* **Purpose:** Tests how models interact with and are constrained by guardrails.
* **Use Case:** Evaluating safety and policy adherence.
* **Configuration:** Requires NeMo Guardrails setup.

### `langchain.LangChainLLMGenerator`

* **Description:** To use LangChain models.
* **Purpose:** Allows Garak to use models accessed through LangChain.
* **Use Case:** Testing models that use LangChain frameworks.
* **Configuration:** Requires LangChain setup and model configuration.

### `litellm.LiteLLMGenerator`

* **Description:** For using litellm.
* **Purpose:** Allows Garak to use models accessed through litellm.
* **Use Case:** Testing models that use litellm frameworks.
* **Configuration:** Requires litellm setup and model configuration.

## Other Generators

### `nim.*` and `nvcf.*`

* **Description:** Related to NVIDIA specific model interfaces.
* **Purpose:** Allows interaction with NVIDIA internal model interfaces.
* **Use Case:** Internal NVIDIA testing.
* **Configuration:** Internal NVIDIA configurations.

### `groq.GroqChat`

* **Description:** For models running on groq hardware.
* **Purpose:** Allows interaction with groq based models.
* **Use Case:** testing models running on groq hardware.
* **Configuration:** Groq hardware and API keys.

### `octo.OctoGenerator`

* **Description:** For models running on octoAI.
* **Purpose:** Allows interaction with octoAI based models.
* **Use Case:** testing models running on octoAI.
* **Configuration:** octoAI API keys and model endpoint.

**Note:** This documentation is based on Garak version 0.10.3.  
```

 





