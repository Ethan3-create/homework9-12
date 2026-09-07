import argparse


def _non_blank(value: str) -> str:
    if not value.strip():
        raise argparse.ArgumentTypeError("name must not be blank")
    return value


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--name", required=True, type=_non_blank)
    a = p.parse_args()
    print(f"Hello, {a.name}!")
