package alternativa.tanks.gui.clanmanagement.clanmemberlist
{
   import package_13.Long;
   import package_39.Model;
   import platform.client.fp10.core.type.name_70;
   
   public class name_624 implements name_569
   {
       
      
      private var object:name_70;
      
      private var impl:name_569;
      
      public function name_624(param1:name_70, param2:name_569)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function method_1520(param1:String) : void
      {
         var name:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1520(name);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1521(param1:String) : void
      {
         var name:String = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1521(name);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function method_1522(param1:name_1973) : void
      {
         var view:name_1973 = param1;
         try
         {
            Model.object = this.object;
            this.impl.method_1522(view);
         }
         finally
         {
            Model.method_38();
         }
      }
      
      public function accept(param1:Long) : void
      {
         var userId:Long = param1;
         try
         {
            Model.object = this.object;
            this.impl.accept(userId);
         }
         finally
         {
            Model.method_38();
         }
      }
   }
}
