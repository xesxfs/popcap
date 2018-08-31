package de.polygonal.ds
{
   public class DListNode implements LinkedListNode
   {
       
      
      public var prev:DListNode;
      
      public var next:DListNode;
      
      public var data;
      
      public function DListNode(obj:*)
      {
         super();
         this.next = this.prev = null;
         this.data = obj;
      }
      
      public function unlink() : void
      {
         if(this.prev)
         {
            this.prev.next = this.next;
         }
         if(this.next)
         {
            this.next.prev = this.prev;
         }
         this.next = this.prev = null;
      }
      
      public function insertAfter(node:DListNode) : void
      {
         node.next = this.next;
         node.prev = this;
         if(this.next)
         {
            this.next.prev = node;
         }
         this.next = node;
      }
      
      public function insertBefore(node:DListNode) : void
      {
         node.next = this;
         node.prev = this.prev;
         if(this.prev)
         {
            this.prev.next = node;
         }
         this.prev = node;
      }
      
      public function toString() : String
      {
         return "[DListNode, data=" + this.data + "]";
      }
   }
}
