@startuml

title Message Delivery Timeline

actor Elena
actor Aleksander
participant "Messaging Server" as Server
queue "Retry Queue" as Queue

skinparam sequenceMessageAlign center
skinparam noteBackgroundColor #FFF6D5
skinparam sequenceArrowThickness 2

Elena -> Server : Привет! Я просто хочу узнать как ты?
Пожалуйста, хватит добавлять меня
в черный список.
Мне очень жаль, как всё развернулось

Server -> Queue : place message in queue

group SERVER FAILURE
note over Server
Critical server error
Messages cannot be delivered
Automatic retry enabled
end note

loop automatic resend
    Queue -> Server : retry delivery
    Server -x Aleksander : delivery failed
end

end

== ≈ 2 YEARS LATER ==

note over Server
Server repaired
Queue finally processed
end note

Queue -> Server : last retry
Server -> Aleksander : deliver message

Aleksander -> Server : processing...

alt normal response
    Server -> Elena : ok
else alternative scenario
    Server -> Elena : *Сделал гит приватным*
end

Elena -> Aleksander : Я пыталась

@enduml
