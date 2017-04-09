(define (problem pickup1234) (:domain Nuclear)
(:requirements :typing :adl)
(:objects
        dump0 - dump
        cleaner0 - cleaner
        drone0 - drone
        cleaner0store - store
        waypoint0 waypoint1 waypoint2 waypoint3 - waypoint
        waypoint4 - dump
        trash0 - ruble
)
(:init
        (at cleaner0 waypoint0)
        (at drone0 waypoint0)
        (store_of cleaner0store cleaner0)
        (empty cleaner0store)
        (at trash0 waypoint3)
        (is_radioactive trash0)
        (death_count_1 drone0)
        (visible waypoint1 waypoint0)
        (visible waypoint0 waypoint1)
        (visible waypoint2 waypoint0)
        (visible waypoint0 waypoint2)
        (visible waypoint2 waypoint1)
        (visible waypoint1 waypoint2)
        (visible waypoint3 waypoint0)
        (visible waypoint0 waypoint3)
        (visible waypoint3 waypoint1)
        (visible waypoint1 waypoint3)
        (visible waypoint3 waypoint2)
        (visible waypoint2 waypoint3)
        (visible waypoint4 waypoint3)
        (visible waypoint3 waypoint4)
        (cleaner_can_traverse cleaner0 waypoint3 waypoint0)
        (cleaner_can_traverse cleaner0 waypoint3 waypoint1)
        (cleaner_can_traverse cleaner0 waypoint1 waypoint2)
        (cleaner_can_traverse cleaner0 waypoint2 waypoint1)
        (cleaner_can_traverse cleaner0 waypoint4 waypoint3)
        (cleaner_can_traverse cleaner0 waypoint3 waypoint4)
        (drone_can_traverse drone0 waypoint3 waypoint0)
        (drone_can_traverse drone0 waypoint0 waypoint3)
        (drone_can_traverse drone0 waypoint3 waypoint1)
        (drone_can_traverse drone0 waypoint1 waypoint3)
        (drone_can_traverse drone0 waypoint1 waypoint2)
        (drone_can_traverse drone0 waypoint2 waypoint1)
        (drone_can_traverse drone0 waypoint4 waypoint3)
        (drone_can_traverse drone0 waypoint3 waypoint4)
)
(:goal (and
            (is_cleaned trash0)
            (or (is_cleaned drone0) (at drone0 waypoint0))
       )
)
)
