Java collections
=======

### Queues

![Java queues - classes Hierarchy](/diagram.png)
  
#### Queue vs Dequeue

From Javadoc: 
> A more complete and consistent set of LIFO stack operations is provided by the Deque interface and its implementations, which should be used in preference to this class

The javadoc from Deque also says
> Deques can also be used as LIFO (Last-In-First-Out) stacks. This interface should be used in preference to the legacy Stack class

However Queue is not abandoned in JDK, AnstractQueue and all it's subclasses are implementation of Queue interface

#### Datastructures holding elements
- Array
- LinkedList
- Priority (Tree)

#### Concurrency control
- Concurrent 
- Synchronous

#### Access type
- Blocking
- Non-blocking

## Methods

Type of Operation	| Throws exception | Returns special value
------------------|------------------|-----------------------
Insert            | add(e)           | offer(e)
Remove            | remove()         | poll()
Examine           | element()        | peek()
