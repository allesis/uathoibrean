run:
    clojure -M -m uathoibrean

stop:
    kill -15 "$(pgrep -f "/nix/store/1v4nfa077rabnxws6kak0s6q9189c52w-clojure-1.12.4.1602/bin/clojure -m:repl/conjure")"

start:
    clj -M:repl/conjure & disown
