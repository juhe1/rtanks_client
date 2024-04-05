package projects.tanks.client.commons.models.layout
{
   import alternativa.osgi.OSGi;
   import package_13.Long;
   import package_38.name_69;
   import package_38.name_840;
   import package_39.Model;
   import platform.client.fp10.core.model.name_66;
   
   public class class_156 extends Model
   {
       
      
      private var var_531:name_840;
      
      protected var server:name_2144;
      
      private var client:name_815;
      
      private var var_25:Long;
      
      public function class_156()
      {
         this.var_531 = name_840(OSGi.getInstance().name_6(name_840));
         this.client = name_815(this);
         this.var_25 = Long.getLong(1223707112,492148927);
         super();
         this.method_770();
      }
      
      protected function method_770() : void
      {
         this.server = new name_2144(name_66(this));
      }
      
      override public function invoke(param1:Long, param2:name_69) : void
      {
         var _loc3_:* = param1;
         var _loc4_:int = 0;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.var_25;
      }
   }
}
