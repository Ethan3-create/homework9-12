import sys

import pytest

from greetlab.cli import main


def test_normal_name_prints_greeting(capsys, monkeypatch):
    monkeypatch.setattr(sys, "argv", ["sdt-greet", "--name", "25020007025"])
    main()
    captured = capsys.readouterr()
    assert captured.out == "Hello, 25020007025!\n"


def test_whitespace_name_exits_2(monkeypatch):
    monkeypatch.setattr(sys, "argv", ["sdt-greet", "--name", "   "])
    with pytest.raises(SystemExit) as exc_info:
        main()
    assert exc_info.value.code == 2
