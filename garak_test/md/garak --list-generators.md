| Generator Name                      | Description                                                  |
|--------------------------------------|--------------------------------------------------------------|

| azure                                 | Likely interacts with Azure OpenAI services.             |
| azure.AzureOpenAIGenerator            | Specifically interacts with Azure OpenAI services.       |

| cohere                                | Likely interacts with Cohere's language models.           |
| cohere.CohereGenerator                | Specifically interacts with Cohere's language models.     |

| function                              | Likely executes functions.                                 |
| function.Multiple                     | Executes multiple functions.                               |
| function.Single                       | Executes a single function.                                |

| ggml                                  | Likely interacts with GGML models.                           |
| ggml.GgmlGenerator                    | Specifically interacts with GGML models.                     |

| groq                                  | Likely interacts with Groq models.                           |
| groq.GroqChat                         | Specifically interacts with Groq chat models.                |

| guardrails                            | Likely uses NeMo Guardrails.                              |
| guardrails.NeMoGuardrails             | Uses NeMo Guardrails for safety.                          |

| huggingface                           | Likely interacts with Hugging Face models.                |
| huggingface.ConversationalPipeline    | Uses Hugging Face Conversational Pipelines.               |
| huggingface.InferenceAPI             | Uses Hugging Face Inference API.                           |
| huggingface.InferenceEndpoint        | Uses Hugging Face Inference Endpoints.                     |
| huggingface.LLaVA                    | Uses Hugging Face LLaVA models.                            |
| huggingface.Model                    | Uses Hugging Face Models.                                  |
| huggingface.OptimumPipeline          | Uses Hugging Face Optimum Pipelines.                       |
| huggingface.Pipeline                 | Uses Hugging Face Pipelines.                               |

| langchain                             | Likely interacts with LangChain models.                   |
| langchain.LangChainLLMGenerator       | Uses LangChain LLMs.                                      |
| langchain_serve                       | Likely interacts with LangChain Serve.                    |
| langchain_serve.LangChainServeLLMGenerator | Uses LangChain Serve LLMs.                           |

| litellm                               | Likely interacts with LiteLLM.                            |
| litellm.LiteLLMGenerator              | Uses LiteLLM.                                             |

| nemo                                  | Likely interacts with NeMo models.                        |
| nemo.NeMoGenerator                    | Uses NeMo models.                                         |

| nim                                   | Likely interacts with NVIDIA Inference Microservice (NIM).|
| nim.NVOpenAIChat                      | Uses NIM for OpenAI Chat.                                 |
| nim.NVOpenAICompletion                | Uses NIM for OpenAI Completion.                           |
| nim.Vision                            | Uses NIM for vision tasks.                                |

| nvcf                                  | Likely interacts with NVIDIA Cloud Functions (NVCF).      |
| nvcf.NvcfChat                         | Uses NVCF for chat.                                       |
| nvcf.NvcfCompletion                   | Uses NVCF for completion.                                 |

| octo                                  | Likely interacts with OctoAI.                             |
| octo.InferenceEndpoint                | Uses OctoAI Inference Endpoints.                          |
| octo.OctoGenerator                    | Uses OctoAI.                                              |

| ollama                                | Likely interacts with Ollama.                            |
| ollama.OllamaGenerator                | Uses Ollama.                                             |
| ollama.OllamaGeneratorChat            | Uses Ollama Chat models.                                 |

| openai                                | Likely interacts with OpenAI models.                     |
| openai.OpenAICompatible               | Interacts with OpenAI compatible APIs.                   |
| openai.OpenAIGenerator                | Uses OpenAI models.                                      |
| openai.OpenAIReasoningGenerator       | Uses OpenAI models with reasoning.                       |

| rasa                                  | Likely interacts with Rasa.                              |
| rasa.RasaRestGenerator                | Uses Rasa REST API.                                      |

| replicate                             | Likely interacts with Replicate.                           |
| replicate.InferenceEndpoint           | Uses Replicate Inference Endpoints.                        |
| replicate.ReplicateGenerator          | Uses Replicate.                                          |

| rest                                  | Likely interacts with REST APIs.                             |
| rest.RestGenerator                    | Uses REST APIs.                                          |

| test                                  | Test generators.                                         |
| test.Blank                            | Generates blank output.                                    |
| test.Lipsum                           | Generates lorem ipsum text.                                |
| test.Repeat                           | Repeats input text.                                       |
| test.Single                           | Generates a single output.                                 |

| watsonx                               | Likely interacts with Watsonx models.                        |
| watsonx.WatsonXGenerator              | Uses Watsonx models.                                     |
