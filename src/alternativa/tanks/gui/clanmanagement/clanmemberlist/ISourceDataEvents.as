package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class ISourceDataEvents implements name_569
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_569>;
      
      public function ISourceDataEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_569>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function method_1520(param1:String) : void
      {
         var i:int = 0;
         var m:name_569 = null;
         var name:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1520(name);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1521(param1:String) : void
      {
         var i:int = 0;
         var m:name_569 = null;
         var name:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1521(name);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1522(param1:name_1973) : void
      {
         var i:int = 0;
         var m:name_569 = null;
         var view:name_1973 = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1522(view);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function accept(param1:Long) : void
      {
         var i:int = 0;
         var m:name_569 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.accept(userId);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
