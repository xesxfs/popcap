package de.polygonal.ds.sort
{
   import de.polygonal.ds.DListNode;
   
   public function dLinkedInsertionSort(node:DListNode, descending:Boolean = false) : DListNode
   {
      var p:DListNode = null;
      var n:DListNode = null;
      var m:DListNode = null;
      var i:DListNode = null;
      var val:* = undefined;
      if(!node)
      {
         return null;
      }
      var h:DListNode = node;
      if(descending)
      {
         n = h.next;
         while(n)
         {
            m = n.next;
            p = n.prev;
            if(p.data < n.data)
            {
               i = p;
               while(i.prev)
               {
                  if(i.prev.data < n.data)
                  {
                     i = i.prev;
                     continue;
                  }
                  break;
               }
               if(m)
               {
                  p.next = m;
                  m.prev = p;
               }
               else
               {
                  p.next = null;
               }
               if(i == h)
               {
                  n.prev = null;
                  n.next = i;
                  i.prev = n;
                  h = n;
               }
               else
               {
                  n.prev = i.prev;
                  i.prev.next = n;
                  n.next = i;
                  i.prev = n;
               }
            }
            n = m;
         }
         return h;
      }
      n = h.next;
      while(n)
      {
         m = n.next;
         p = n.prev;
         if(p.data > n.data)
         {
            i = p;
            while(i.prev)
            {
               if(i.prev.data > n.data)
               {
                  i = i.prev;
                  continue;
               }
               break;
            }
            if(m)
            {
               p.next = m;
               m.prev = p;
            }
            else
            {
               p.next = null;
            }
            if(i == h)
            {
               n.prev = null;
               n.next = i;
               i.prev = n;
               h = n;
            }
            else
            {
               n.prev = i.prev;
               i.prev.next = n;
               n.next = i;
               i.prev = n;
            }
         }
         n = m;
      }
      return h;
   }
}
