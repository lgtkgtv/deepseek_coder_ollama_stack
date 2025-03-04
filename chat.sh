#!/bin/bash

: << 'COMMENT'

This API response is a streaming response — The model sends multiple chunks of data as soon as they are generated. Each chunk is a small JSON object, rather than the whole response at once.

What you received:

{"model":"deepseek-coder:1.3b","created_at":"2025-03-04T10:46:45.628109728Z","message":{"role":"assistant","content":"Hello"},"done":false}
{"model":"deepseek-coder:1.3b","created_at":"2025-03-04T10:46:45.669657405Z","message":{"role":"assistant","content":""},"done_reason":"stop","done":true,"total_duration":2231937188,"load_duration":1021051522,"prompt_eval_count":71,"prompt_eval_duration":1014000000,"eval_count":2,"eval_duration":42000000}


## Explanation of Each Field

Field	                Meaning
-----                   -------
model	                Name of the model used (deepseek-coder:1.3b)
created_at	            Timestamp of the response chunk
message.role	        Role (assistant means model reply)
message.content	        Actual text the model generated in this chunk
done	                Whether this is the final chunk
done_reason	            Why it stopped (e.g., stop, meaning natural stop)
total_duration	        Total processing time (nanoseconds)
load_duration	        Time spent loading model into memory
prompt_eval_count	    Number of tokens evaluated in the prompt
prompt_eval_duration	Time spent evaluating the prompt (ns)
eval_count	            Number of tokens generated (in the response)
eval_duration	        Time spent generating response tokens (ns)

Where is the actual response content?
👉 This part is the actual generated text:
{"message":{"role":"assistant","content":"Hello"}}
That is the model reply — Hello.

COMMENT


curl -s -X POST http://localhost:11434/api/chat -d "{
  \"model\": \"deepseek-coder:1.3b\",
  \"messages\": [{\"role\": \"user\", \"content\": \"$1\"}]
}" | grep -oP '"content":"\K[^"]*'

