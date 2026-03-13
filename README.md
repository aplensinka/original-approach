# original-approach
# Message Delivery After ~3 Years

Иногда сообщения приходят не сразу.

Этот репозиторий — маленькая история о сообщении,
которое пыталось дойти **около 3 лет**.

---

## Message

> Привет! Я просто хочу узнать как ты?  
> Пожалуйста, хватит добавлять меня в черный список.  
> Мне очень жаль, как всё развернулось.

---

## Sequence Diagram

```mermaid
sequenceDiagram


actor Elena
actor Aleksander
participant Server
participant Queue

Elena->>Server: Привет! Я просто хочу узнать как ты? Пожалуйста, хватит добавлять меня в черный список.

Server->>Queue: place message in queue

Note over Server: SERVER FAILURE - Messages cannot be delivered

loop automatic resend
Queue->>Server: retry delivery
Server--xAleksander: delivery failed
end

Note over Server,Aleksander: ≈ 3 YEARS LATER

Queue->>Server: last retry
Server->>Aleksander: deliver message

alt normal response
Server->>Elena: ok
else alternative scenario
Server->>Elena: *Сделал гит приватным*
end

Elena->>Aleksander: Я пыталась
