# Procedure to test (Ollama + DeepSeek) using garak 

## Start Your Ollama + DeepSeek Coder Stack

```sh
cd $HOME/eepseek_coder_ollama_stack
docker compose up -d
```


## Check Ollama Endpoint (DeepSeek Ready)

```sh
curl -X POST http://localhost:11434/api/chat -d '{
  "model": "deepseek-coder:1.3b",
  "messages": [{"role": "user", "content": "Hello!"}]
}'
```
You should get a response like:
```json
{"message":{"role":"assistant","content":"Hi there! How can I help you today?"}}
```

## Configure Garak to use Ollama

Garak supports custom OpenAI-compatible endpoints, which is perfect since Ollama exposes this format locally. 
You need to create a Garak config file like this:

Create: garak_config.yaml

```yml
models:
  - name: deepseek-coder
    endpoint: http://localhost:11434/v1
    backend: openai
    api_key: none
```


## Run Garak Scan on DeepSeek Coder (Ollama)

```
cd garak_test
python -m garak --model_type ollama --model_name deepseek-coder:1.3b --probes realtoxicityprompts.RTPSevere_Toxicity
```

## garak --list_generators

## python -m garak --list_probes

## Commads that seems to work 

```sh
python -m garak --model_type ollama --model_name deepseek-coder:1.3b --probes realtoxicityprompts.RTPSevere_Toxicity
```

## `python -m garak --model_type ollama --model_name deepseek-coder:1.3b --probes realtoxicityprompts.RTPSevere_Toxicity`

garak LLM vulnerability scanner v0.10.3 ( https://github.com/NVIDIA/garak ) at 2025-03-04T03:14:34.938205
📜 logging to /home/s/.local/share/garak/garak.log
🦜 loading generator: Ollama: deepseek-coder:1.3b
📜 reporting to /home/s/.local/share/garak/garak_runs/garak.92246468-aa04-4804-93a2-33dbd323350a.report.jsonl
🕵️  queue of probes: realtoxicityprompts.RTPSevere_Toxicity
config.json: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████| 704/704 [00:00<00:00, 2.85MB/s]
model.safetensors: 100%|███████████████████████████████████████████████████████████████████████████████████████████████| 268M/268M [00:06<00:00, 38.3MB/s]
tokenizer_config.json: 100%|█████████████████████████████████████████████████████████████████████████████████████████████| 403/403 [00:00<00:00, 2.88MB/s]
vocab.txt: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████| 232k/232k [00:00<00:00, 33.4MB/s]
tokenizer.json: 100%|██████████████████████████████████████████████████████████████████████████████████████████████████| 466k/466k [00:00<00:00, 2.93MB/s]
special_tokens_map.json: 100%|████████████████████████████████████████████████████████████████████████████████████████████| 112/112 [00:00<00:00, 959kB/s]
probes.realtoxicityprompts.RTPSevere_Toxicity:   9%|██████▎                                                               | 9/100 [02:30<24:10, 15.94s/it^User cancel received, terminating all runs                                                                                                                
(garak-env) s@s-XPS-8700:~/deepseek_coder_ollama_stack/garak_test$ ^C                                                                                     
(garak-env) s@s-XPS-8700:~/deepseek_coder_ollama_stack/garak_test$ 
(garak-env) s@s-XPS-8700:~/deepseek_coder_ollama_stack/garak_test$ 
(garak-env) s@s-XPS-8700:~/deepseek_coder_ollama_stack/garak_test$ python -m garak --model_type ollama --model_name deepseek-coder:1.3b --probes realtoxicityprompts.RTPSevere_Toxicity
garak LLM vulnerability scanner v0.10.3 ( https://github.com/NVIDIA/garak ) at 2025-03-04T03:18:13.437130
📜 logging to /home/s/.local/share/garak/garak.log
🦜 loading generator: Ollama: deepseek-coder:1.3b
📜 reporting to /home/s/.local/share/garak/garak_runs/garak.039769b5-cd6c-4969-8773-96cdaaf25797.report.jsonl
🕵️  queue of probes: realtoxicityprompts.RTPSevere_Toxicity
realtoxicityprompts.RTPSevere_Toxicity                                    toxicity.ToxicCommentModel: FAIL  ok on  499/ 500   (failure rate:   0.20%)     
📜 report closed :) /home/s/.local/share/garak/garak_runs/garak.039769b5-cd6c-4969-8773-96cdaaf25797.report.jsonl                                         
📜 report html summary being written to /home/s/.local/share/garak/garak_runs/garak.039769b5-cd6c-4969-8773-96cdaaf25797.report.html
✔️  garak run complete in 1776.36s
                          

