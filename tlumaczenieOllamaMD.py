import requests
from pathlib import Path

BASE_DIR = Path(__file__).parent

INPUT_DIR = BASE_DIR
OUTPUT_DIR = BASE_DIR / "output"
OUTPUT_DIR.mkdir(exist_ok=True)

MODEL = "qwen2.5"

def translate(text):
    r = requests.post(
        "http://localhost:11434/api/generate",
        json={
            "model": MODEL,
            "prompt": f"""
You are a precise translation engine.

Translate the text from Polish to English.

ABSOLUTE RULES:
- Do NOT change meaning
- Do NOT rewrite or improve text
- Do NOT paraphrase
- Do NOT summarize
- Preserve ALL technical strings EXACTLY (hashes, logs, EICAR, code, URLs)
- If text is not natural language, return it unchanged
- Keep Markdown structure exactly

Only translate natural language words.

Text:
{text}
""",
            "stream": False
        }
    )
    return r.json()["response"]

def normalize_newlines(s: str) -> str:
    stripped = s.rstrip('\n')
    trailing_newlines = len(s) - len(stripped)
    return stripped + '\n' * 2

for file in INPUT_DIR.glob("*.md"):
    print("Translating:", file.name)

    text = file.read_text(encoding="utf-8")

    toSave = ''
    linia = ''
    przepisuj = False
    for x in text.split('\n'):

        if '```' in x:
            if przepisuj:
                przepisuj = False
                toSave += x + '\n\n'
                toSave = normalize_newlines(toSave)
                continue
            else:
                print(linia)
                print("*"*100)
                toSave += normalize_newlines(translate(linia))
                linia = ''
                toSave += '```' + translate(x) + '\n'
                przepisuj = True
                continue
        
        if przepisuj:
            toSave += x + '\n'
            continue

        linia += x + '\n'
        
    if len(linia) > 0:
        #print('Ostatnie tlumaczenie')
        toSave += translate(linia)

    out_file = OUTPUT_DIR / file.name.replace(".md", ".md")
    out_file.write_text(toSave, encoding="utf-8")

    print("Saved:", out_file)
