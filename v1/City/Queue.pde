/*public class Queue<T>
{
  //no time to implement transportation, can't use road-> can't use queue-> can't use DLLNODE
  //this is a modified queue. IF the queue is full, it will act like a normal queue.
  //However, if the queue is empty, items will be able to jump up to the closest one the car is able to. In short, with heavy traffic, this acts like a queue, but 
  //in times of lighter traffic, cars can jump!
  //instance variables
  private DLLNode<T> _front, _end;
  private int _size;


  // default constructor creates an empty queue
  public Queue(int max) 
  { 
    _size = max;
    _front=new DLLNode<T>(null,null,null);
    for(int i=0; i<max;i++) {
        _front.setNext(_front);
        
    }
  }//end default constructor


  public boolean enqueue( T enQVal ) 
  {
    //special case: when enqueuing to an empty list, 
    //make _front && _end point to same node
    if ( isEmpty() ) {
      _front = _end = new DLLNode<T>( enQVal, null,null );
    }
    else {
      _end.setNext( new DLLNode<T>( enQVal, null,null) );
      _end = _end.getNext();
    }
    _size++;
    return true;
  }//end enqueue()


  // remove and return thing at front of queue
  // assume _queue ! empty
  public T dequeue() 
  { 
    T retVal = _front.getCargo();
    _front = _front.getNext();

    if ( _front == null ) //just moved past last node
      _end = null;      //update _end to reflect emptiness

    _size--;

    if ( _size > 1 )  sample();

    return retVal;
  }//end dequeue()


  public T peekFront() 
  {
    return _front.getValue();

  }
  public T setCargo( T newCargo ) {
  T foo = getCargo();
  _cargo = newCargo;
  return foo;
    }

    public DLLNode<T> setNext( DLLNode<T> newNext ) {
  DLLNode<T> foo = getNext();
  _nextNode = newNext;
  return foo;
    }

    public DLLNode<T> setPrev( DLLNode<T> newPrev ) {
  DLLNode<T> foo = getPrev();
  _prevNode = newPrev;
  return foo;
    }


  /******************************************
   * void sample() -- a means of "shuffling" the queue
   * Algo:
   * Move front element to end, x times. (x=random int)
   *  ( 0 <= x < queue size - 1 )
   ******************************************/
  /*public void sample () 
  {
    int cycles = (int)( _size * Math.random() );
    for( int i = 0; i < cycles; i++ )
      enqueue( dequeue() );
  }//end sample()


  public boolean isEmpty() 
  {
    return _front == null;
  } //O(1)
  public boolean isNull() {
  }

    // print each node, separated by spaces
  public String toString() 
  { 
    String foo = "";
    DLLNode<T> tmp = _front;
    while ( tmp != null ) {
      foo += tmp.getCargo() + " ";
      tmp = tmp.getNext();
    }
    return foo;
  }//end toString()*/
