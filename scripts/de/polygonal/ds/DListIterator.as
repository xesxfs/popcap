package de.polygonal.ds
{
   public class DListIterator implements Iterator
   {
       
      
      public var node:DListNode;
      
      public var list:DLinkedList;
      
      public function DListIterator(list:DLinkedList, node:DListNode = null)
      {
         super();
         this.list = list;
         this.node = node;
      }
      
      public function remove() : Boolean
      {
         return this.list.remove(this);
      }
      
      public function back() : void
      {
         if(this.node)
         {
            this.node = this.node.prev;
         }
      }
      
      public function start() : void
      {
         this.node = this.list.head;
      }
      
      public function get data() : *
      {
         if(this.node)
         {
            return this.node.data;
         }
         return null;
      }
      
      public function forth() : void
      {
         if(this.node)
         {
            this.node = this.node.next;
         }
      }
      
      public function toString() : String
      {
         return "{DListIterator, data=" + (!!this.node?this.node.data:"null") + "}";
      }
      
      public function hasNext() : Boolean
      {
         return Boolean(this.node);
      }
      
      public function valid() : Boolean
      {
         return Boolean(this.node);
      }
      
      public function next() : *
      {
         var obj:* = undefined;
         if(this.hasNext())
         {
            obj = this.node.data;
            this.node = this.node.next;
            return obj;
         }
         return null;
      }
      
      public function set data(obj:*) : void
      {
         this.node.data = obj;
      }
      
      public function end() : void
      {
         this.node = this.list.tail;
      }
   }
}
