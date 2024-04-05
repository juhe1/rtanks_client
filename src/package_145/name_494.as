package package_145
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.logging.name_26;
   import package_348.name_1674;
   import package_349.name_1675;
   import platform.client.fp10.core.type.name_70;
   import platform.clients.fp10.libraries.alternativapartners.service.name_493;
   
   public class name_494 implements name_493
   {
      
      public static var log:name_26 = name_26(OSGi.getInstance().name_6(name_26));
       
      
      private var var_971:name_1675;
      
      private var var_972:Boolean = false;
      
      private var var_973:Boolean = false;
      
      public function name_494()
      {
         super();
      }
      
      public function method_1187() : Boolean
      {
         var _loc1_:String = this.method_1185();
         return Boolean(_loc1_);
      }
      
      public function method_1185() : String
      {
         return "".toLowerCase();
      }
      
      public function method_1188() : Boolean
      {
         return Boolean(this.var_971) ? Boolean(this.var_971.method_1188()) : Boolean(false);
      }
      
      public function method_1186() : void
      {
         if(Boolean(this.var_971))
         {
            this.var_971.name_1676();
         }
      }
      
      public function hasOwnPaymentSystem() : Boolean
      {
         return this.var_972;
      }
      
      public function hasSocialFunction() : Boolean
      {
         return this.var_973;
      }
      
      public function method_1193() : String
      {
         return Boolean(this.var_971) ? String(this.var_971.method_1193()) : "";
      }
      
      public function method_1191() : Boolean
      {
         return Boolean(this.var_971) ? Boolean(this.var_971.method_1191()) : Boolean(true);
      }
      
      public function method_1189(param1:name_70) : void
      {
         this.var_971 = name_1675(param1.name_176(name_1675));
         this.var_972 = name_1674(param1.name_176(name_1674)).hasOwnPaymentSystem();
         this.var_973 = name_1674(param1.name_176(name_1674)).hasSocialFunction();
      }
      
      public function method_1192() : Boolean
      {
         return Boolean(this.var_971) ? Boolean(this.var_971.method_1192()) : Boolean(false);
      }
      
      public function method_1190(param1:String) : Boolean
      {
         var _loc2_:String = this.method_1185();
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.toLocaleLowerCase() == param1.toLocaleLowerCase();
      }
   }
}
