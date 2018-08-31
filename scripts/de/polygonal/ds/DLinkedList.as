package de.polygonal.ds
{
   import de.polygonal.ds.sort.compare.compareStringCaseInSensitive;
   import de.polygonal.ds.sort.compare.compareStringCaseInSensitiveDesc;
   import de.polygonal.ds.sort.compare.compareStringCaseSensitive;
   import de.polygonal.ds.sort.compare.compareStringCaseSensitiveDesc;
   import de.polygonal.ds.sort.dLinkedInsertionSort;
   import de.polygonal.ds.sort.dLinkedInsertionSortCmp;
   import de.polygonal.ds.sort.dLinkedMergeSort;
   import de.polygonal.ds.sort.dLinkedMergeSortCmp;
   
   public class DLinkedList implements Collection
   {
       
      
      private var _count:int;
      
      public var tail:DListNode;
      
      public var head:DListNode;
      
      public function DLinkedList(... args)
      {
         super();
         this.head = this.tail = null;
         this._count = 0;
         if(args.length > 0)
         {
            this.append.apply(this,args);
         }
      }
      
      public function get size() : int
      {
         return this._count;
      }
      
      public function isEmpty() : Boolean
      {
         return this._count == 0;
      }
      
      public function remove(itr:DListIterator) : Boolean
      {
         if(itr.list != this || !itr.node)
         {
            return false;
         }
         var node:DListNode = itr.node;
         if(node == this.head)
         {
            this.head = this.head.next;
         }
         else if(node == this.tail)
         {
            this.tail = this.tail.prev;
         }
         if(itr.node)
         {
            itr.node = itr.node.next;
         }
         if(node.prev)
         {
            node.prev.next = node.next;
         }
         if(node.next)
         {
            node.next.prev = node.prev;
         }
         node.next = node.prev = null;
         if(this.head == null)
         {
            this.tail = null;
         }
         this._count--;
         return true;
      }
      
      public function removeHead() : *
      {
         var obj:* = undefined;
         if(this.head)
         {
            obj = this.head.data;
            this.head = this.head.next;
            if(this.head)
            {
               this.head.prev = null;
            }
            else
            {
               this.tail = null;
            }
            this._count--;
            return obj;
         }
         return null;
      }
      
      public function clear() : void
      {
         var next:DListNode = null;
         var node:DListNode = this.head;
         this.head = null;
         while(node)
         {
            next = node.next;
            node.next = node.prev = null;
            node = next;
         }
         this._count = 0;
      }
      
      public function prepend(... args) : DListNode
      {
         var t:DListNode = null;
         var i:int = 0;
         var k:int = args.length;
         var node:DListNode = new DListNode(args[int(k - 1)]);
         if(this.head)
         {
            this.head.insertBefore(node);
            this.head = this.head.prev;
         }
         else
         {
            this.head = this.tail = node;
         }
         if(k > 1)
         {
            t = node;
            for(i = k - 2; i >= 0; i--)
            {
               node = new DListNode(args[i]);
               this.head.insertBefore(node);
               this.head = this.head.prev;
            }
            this._count = this._count + k;
            return t;
         }
         this._count++;
         return node;
      }
      
      public function popDown() : void
      {
         var t:DListNode = this.tail;
         if(this.tail.prev == this.head)
         {
            this.tail = this.head;
            this.tail.next = null;
            this.head = t;
            this.head.prev = null;
            this.head.next = this.tail;
            this.tail.prev = this.head;
         }
         else
         {
            this.tail = this.tail.prev;
            this.tail.next = null;
            this.head.prev = t;
            t.prev = null;
            t.next = this.head;
            this.head = t;
         }
      }
      
      public function concat(... args) : DLinkedList
      {
         var a:DLinkedList = null;
         var n:DListNode = null;
         var c:DLinkedList = new DLinkedList();
         n = this.head;
         while(n)
         {
            c.append(n.data);
            n = n.next;
         }
         var k:int = args.length;
         for(var i:int = 0; i < k; i++)
         {
            a = args[i];
            n = a.head;
            while(n)
            {
               c.append(n.data);
               n = n.next;
            }
         }
         return c;
      }
      
      public function insertBefore(itr:DListIterator, obj:*) : DListNode
      {
         var node:DListNode = null;
         if(itr.list != this)
         {
            return null;
         }
         if(itr.node)
         {
            node = new DListNode(obj);
            itr.node.insertBefore(node);
            if(itr.node == this.head)
            {
               this.head = this.head.prev;
            }
            this._count++;
            return node;
         }
         return this.prepend(obj);
      }
      
      public function append(... args) : DListNode
      {
         var t:DListNode = null;
         var i:int = 0;
         var k:int = args.length;
         var node:DListNode = new DListNode(args[0]);
         if(this.head)
         {
            this.tail.insertAfter(node);
            this.tail = this.tail.next;
         }
         else
         {
            this.head = this.tail = node;
         }
         if(k > 1)
         {
            t = node;
            for(i = 1; i < k; i++)
            {
               node = new DListNode(args[i]);
               this.tail.insertAfter(node);
               this.tail = this.tail.next;
            }
            this._count = this._count + k;
            return t;
         }
         this._count++;
         return node;
      }
      
      public function sort(... sortOptions) : void
      {
         var b:int = 0;
         var cmp:Function = null;
         var o:* = undefined;
         if(this._count <= 1)
         {
            return;
         }
         if(sortOptions.length > 0)
         {
            b = 0;
            cmp = null;
            o = sortOptions[0];
            if(o is Function)
            {
               cmp = o;
               if(sortOptions.length > 1)
               {
                  o = sortOptions[1];
                  if(o is int)
                  {
                     b = o;
                  }
               }
            }
            else if(o is int)
            {
               b = o;
            }
            if(Boolean(cmp))
            {
               if(b & 2)
               {
                  this.head = dLinkedInsertionSortCmp(this.head,cmp,b == 18);
               }
               else
               {
                  this.head = dLinkedMergeSortCmp(this.head,cmp,b == 16);
               }
            }
            else if(b & 2)
            {
               if(b & 4)
               {
                  if(b == 22)
                  {
                     this.head = dLinkedInsertionSortCmp(this.head,compareStringCaseSensitiveDesc);
                  }
                  else if(b == 14)
                  {
                     this.head = dLinkedInsertionSortCmp(this.head,compareStringCaseInSensitive);
                  }
                  else if(b == 30)
                  {
                     this.head = dLinkedInsertionSortCmp(this.head,compareStringCaseInSensitiveDesc);
                  }
                  else
                  {
                     this.head = dLinkedInsertionSortCmp(this.head,compareStringCaseSensitive);
                  }
               }
               else
               {
                  this.head = dLinkedInsertionSort(this.head,b == 18);
               }
            }
            else if(b & 4)
            {
               if(b == 20)
               {
                  this.head = dLinkedMergeSortCmp(this.head,compareStringCaseSensitiveDesc);
               }
               else if(b == 12)
               {
                  this.head = dLinkedMergeSortCmp(this.head,compareStringCaseInSensitive);
               }
               else if(b == 28)
               {
                  this.head = dLinkedMergeSortCmp(this.head,compareStringCaseInSensitiveDesc);
               }
               else
               {
                  this.head = dLinkedMergeSortCmp(this.head,compareStringCaseSensitive);
               }
            }
            else if(b & 16)
            {
               this.head = dLinkedMergeSort(this.head,true);
            }
         }
         else
         {
            this.head = dLinkedMergeSort(this.head);
         }
      }
      
      public function contains(obj:*) : Boolean
      {
         var node:DListNode = this.head;
         while(node)
         {
            if(node.data == obj)
            {
               return true;
            }
            node = node.next;
         }
         return false;
      }
      
      public function reverse() : void
      {
         var mark:DListNode = null;
         var next:DListNode = null;
         if(this._count == 0)
         {
            return;
         }
         var node:DListNode = this.tail;
         while(node)
         {
            mark = node.prev;
            if(!node.next)
            {
               node.next = node.prev;
               node.prev = null;
               this.head = node;
            }
            else if(!node.prev)
            {
               node.prev = node.next;
               node.next = null;
               this.tail = node;
            }
            else
            {
               next = node.next;
               node.next = node.prev;
               node.prev = next;
            }
            node = mark;
         }
      }
      
      public function insertAfter(itr:DListIterator, obj:*) : DListNode
      {
         var node:DListNode = null;
         if(itr.list != this)
         {
            return null;
         }
         if(itr.node)
         {
            node = new DListNode(obj);
            itr.node.insertAfter(node);
            if(itr.node == this.tail)
            {
               this.tail = itr.node.next;
            }
            this._count++;
            return node;
         }
         return this.append(obj);
      }
      
      public function getIterator() : Iterator
      {
         return new DListIterator(this,this.head);
      }
      
      public function toArray() : Array
      {
         var a:Array = [];
         var node:DListNode = this.head;
         while(node)
         {
            a.push(node.data);
            node = node.next;
         }
         return a;
      }
      
      public function getListIterator() : DListIterator
      {
         return new DListIterator(this,this.head);
      }
      
      public function join(sep:*) : String
      {
         if(this._count == 0)
         {
            return "";
         }
         var s:String = "";
         var node:DListNode = this.head;
         while(node.next)
         {
            s = s + (node.data + sep);
            node = node.next;
         }
         s = s + node.data;
         return s;
      }
      
      public function toString() : String
      {
         return "[DLinkedList > has " + this.size + " nodes]";
      }
      
      public function removeTail() : *
      {
         var obj:* = undefined;
         if(this.tail)
         {
            obj = this.tail.data;
            this.tail = this.tail.prev;
            if(this.tail)
            {
               this.tail.next = null;
            }
            else
            {
               this.head = null;
            }
            this._count--;
            return obj;
         }
         return null;
      }
      
      public function lastNodeOf(obj:*, from:DListIterator = null) : DListIterator
      {
         if(from != null)
         {
            if(from.list != this)
            {
               return null;
            }
         }
         var node:DListNode = from == null?this.tail:from.node;
         while(node)
         {
            if(node.data === obj)
            {
               return new DListIterator(this,node);
            }
            node = node.prev;
         }
         return null;
      }
      
      public function merge(... args) : void
      {
         var a:DLinkedList = null;
         a = args[0];
         if(a.head)
         {
            if(this.head)
            {
               this.tail.next = a.head;
               a.head.prev = this.tail;
               this.tail = a.tail;
            }
            else
            {
               this.head = a.head;
               this.tail = a.tail;
            }
            this._count = this._count + a.size;
         }
         var k:int = args.length;
         for(var i:int = 1; i < k; i++)
         {
            a = args[i];
            if(a.head)
            {
               this.tail.next = a.head;
               a.head.prev = this.tail;
               this.tail = a.tail;
               this._count = this._count + a.size;
            }
         }
      }
      
      public function nodeOf(obj:*, from:DListIterator = null) : DListIterator
      {
         if(from != null)
         {
            if(from.list != this)
            {
               return null;
            }
         }
         var node:DListNode = from == null?this.head:from.node;
         while(node)
         {
            if(node.data === obj)
            {
               return new DListIterator(this,node);
            }
            node = node.next;
         }
         return null;
      }
      
      public function dump() : String
      {
         if(this.head == null)
         {
            return "DLinkedList, empty";
         }
         var s:* = "DLinkedList, has " + this._count + " node" + (this._count == 1?"":"s") + "\n|< Head\n";
         var itr:DListIterator = this.getListIterator();
         while(itr.valid())
         {
            s = s + ("\t" + itr.data + "\n");
            itr.forth();
         }
         s = s + "Tail >|";
         return s;
      }
      
      public function splice(start:DListIterator, deleteCount:uint = 4.294967295E9, ... args) : DLinkedList
      {
         var s:DListNode = null;
         var t:DListNode = null;
         var c:DLinkedList = null;
         var i:int = 0;
         var k:int = 0;
         var n:DListNode = null;
         if(start)
         {
            if(start.list != this)
            {
               return null;
            }
         }
         if(start.node)
         {
            s = start.node;
            t = start.node.prev;
            c = new DLinkedList();
            if(deleteCount == 4294967295)
            {
               if(start.node == this.tail)
               {
                  return c;
               }
               while(start.node)
               {
                  c.append(start.node.data);
                  start.remove();
               }
               start.list = c;
               start.node = s;
               return c;
            }
            for(i = 0; i < deleteCount; )
            {
               if(start.node)
               {
                  c.append(start.node.data);
                  start.remove();
                  i++;
                  continue;
               }
               break;
            }
            k = args.length;
            if(k > 0)
            {
               if(this._count == 0)
               {
                  for(i = 0; i < k; i++)
                  {
                     this.append(args[i]);
                  }
               }
               else if(t == null)
               {
                  n = this.prepend(args[0]);
                  for(i = 1; i < k; i++)
                  {
                     n.insertAfter(new DListNode(args[i]));
                     if(n == this.tail)
                     {
                        this.tail = n.next;
                     }
                     n = n.next;
                     this._count++;
                  }
               }
               else
               {
                  n = t;
                  for(i = 0; i < k; i++)
                  {
                     n.insertAfter(new DListNode(args[i]));
                     if(n == this.tail)
                     {
                        this.tail = n.next;
                     }
                     n = n.next;
                     this._count++;
                  }
               }
               start.node = n;
            }
            else
            {
               start.node = s;
            }
            start.list = c;
            return c;
         }
         return null;
      }
      
      public function shiftUp() : void
      {
         var t:DListNode = this.head;
         if(this.head.next == this.tail)
         {
            this.head = this.tail;
            this.head.prev = null;
            this.tail = t;
            this.tail.next = null;
            this.head.next = this.tail;
            this.tail.prev = this.head;
         }
         else
         {
            this.head = this.head.next;
            this.head.prev = null;
            this.tail.next = t;
            t.next = null;
            t.prev = this.tail;
            this.tail = t;
         }
      }
   }
}
