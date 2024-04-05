package alternativa.tanks.models.clan
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   import platform.client.fp10.core.type.name_70;
   
   public class IClanModelEvents implements name_572
   {
       
      
      private var object:name_70;
      
      private var impl:Vector.<name_572>;
      
      public function IClanModelEvents(param1:name_70, param2:Vector.<name_66>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<name_572>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function name_882() : void
      {
         var i:int = 0;
         var m:name_572 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.name_882();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1446(param1:Long) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1446(userId);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function name_883(param1:Long) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.name_883(userId);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_371(param1:Long) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_371(userId);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_346(param1:Long) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_346(userId);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_370() : void
      {
         var i:int = 0;
         var m:name_572 = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_370();
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1445(param1:String) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var uid:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_1445(uid);
               i++;
            }
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_340(param1:Long) : void
      {
         var i:int = 0;
         var m:name_572 = null;
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.method_340(userId);
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
