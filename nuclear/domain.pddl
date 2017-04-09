(define (domain Nuclear)
(:requirements :typing :adl)
(:types
       store - object
       waypoint - object
           dump - waypoint
       pickable - object
           cleaner - pickable
           drone - pickable
           ruble - pickable
)
(:predicates
             (at ?p - pickable ?w - waypoint)
             (death_count_0 ?p - pickable)
             (death_count_1 ?p - pickable)
             (death_count_2 ?p - pickable)
             (death_count_3 ?p - pickable)
             (is_radioactive ?x - pickable)
             (is_cleaned ?r - pickable)
             (assesed ?x - pickable)
             (cleaner_can_traverse ?r - cleaner ?x - waypoint ?y - waypoint)
             (drone_can_traverse ?r - drone ?x - waypoint ?y - waypoint)
             (visible ?w - waypoint ?p - waypoint)
             (empty ?s - store)
             (full ?r - pickable ?s - store)
             (store_of ?s - store ?r - cleaner)
)

(:action walk
:parameters (?cleaner - cleaner ?y - waypoint ?z - waypoint) 
:precondition (and
                   (cleaner_can_traverse ?cleaner ?y ?z)
                   (at ?cleaner ?y)
                   (visible ?y ?z)
              )
:effect (and 
             (not (at ?cleaner ?y))
             (at ?cleaner ?z)
        )
)

(:action fly
:parameters (?drone - drone ?y - waypoint ?z - waypoint) 
:precondition (and
                   (drone_can_traverse ?drone ?y ?z)
                   (at ?drone ?y)
                   (visible ?y ?z)
                   (not (death_count_3 ?drone))
              )
:effect (and 
             (not (at ?drone ?y))
             (at ?drone ?z)
        )
)

(:action asses_for_radiation_1
:parameters (?drone - drone ?pickable - pickable ?w - waypoint)
:precondition (and
              (at ?pickable ?w)
              (at ?drone ?w)
              (death_count_0 ?drone)
              )
:effect (and
        (assesed ?pickable)
        (death_count_1 ?drone)
        (not (death_count_0 ?drone))
        )
)

(:action asses_for_radiation_2
:parameters (?drone - drone ?pickable - pickable ?w - waypoint)
:precondition (and
              (at ?pickable ?w)
              (at ?drone ?w)
              (death_count_1 ?drone)
              )
:effect (and
        (assesed ?pickable)
        (death_count_2 ?drone)
        (not (death_count_1 ?drone))
        )
)

(:action asses_for_radiation_3
:parameters (?drone - drone ?pickable - pickable ?w - waypoint)
:precondition (and
              (at ?pickable ?w)
              (at ?drone ?w)
              (death_count_2 ?drone)
              )
:effect (and
        (assesed ?pickable)
        (death_count_3 ?drone)
        (is_radioactive ?drone)
        (assesed ?drone)
        (not (death_count_2 ?drone))
        )
)

(:action pickup_radioactive
:parameters (?cleaner - cleaner ?s - store ?pickable - pickable ?rublew - waypoint ?cleanerw - waypoint)
:precondition (and
              (at ?cleaner ?cleanerw)
              (at ?pickable ?rublew)
              (visible ?cleanerw ?rublew)
              (assesed ?pickable)
              (is_radioactive ?pickable)
              (store_of ?s ?cleaner)
              (empty ?s)
              )
:effect (and
        (not (empty ?s))
        (full ?pickable ?s)
        (cleaner_can_traverse ?cleaner ?cleanerw ?rublew)
        (not (at ?pickable ?rublew))
        )
)

(:action drop
:parameters (?cleaner - cleaner ?s - store ?pickable - pickable ?w - dump)
:precondition (and
              (store_of ?s ?cleaner)
              (full ?pickable ?s)
              (at ?cleaner ?w)
              )
:effect (and
        (not (full ?pickable ?s))
        (empty ?s)
        (is_cleaned ?pickable)
        )
)
)
