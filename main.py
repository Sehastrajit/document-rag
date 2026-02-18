from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

openai_api = os.getenv("OpenAi_API")

client = OpenAI(
  base_url = "https://integrate.api.nvidia.com/v1",
  api_key = openai_api
)

completion = client.chat.completions.create(
  model="microsoft/phi-3-mini-128k-instruct",
  messages=[{"role":"user","content":"what are the number of states in India?"}],
  temperature=0.2,
  top_p=0.7,
  max_tokens=1024,
  stream=True
)

for chunk in completion:
  if chunk.choices[0].delta.content is not None:
    print(chunk.choices[0].delta.content, end="")

