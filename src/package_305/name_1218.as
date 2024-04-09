package package_305
{
   import alternativa.osgi.OSGi;
   import package_101.name_1215;
   import package_39.Model;
   import package_46.BattleEventSupport;
   import package_46.name_138;
   import package_46.name_153;
   import package_46.name_158;
   import package_46.name_96;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1218 implements name_1216, AutoClosable
   {
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().getService(name_96) as name_96;
       
      
      private var name_700:name_70;
      
      private var server:name_1215;
      
      private var var_540:BattleEventSupport;
      
      private var var_2051:Boolean;
      
      private var var_2050:Boolean;
      
      public function name_1218(param1:name_70, param2:name_1215)
      {
         super();
         this.name_700 = param1;
         this.server = param2;
         this.var_540 = new BattleEventSupport(battleEventDispatcher);
         this.var_540.name_1221(name_138,this.method_2136);
         this.var_540.name_1221(name_153,this.method_2135);
         this.var_540.name_1221(name_158,this.method_2137);
         this.var_540.method_2132();
      }
      
      private function method_2136(param1:Object) : void
      {
         this.var_2051 = true;
      }
      
      private function method_2135(param1:Object) : void
      {
         this.var_2051 = false;
         if(this.var_2050)
         {
            this.method_2134();
         }
      }
      
      private function method_2137(param1:name_158) : void
      {
         if(param1.tank.method_484() == this.name_700)
         {
            this.var_2050 = false;
         }
      }
      
      public function name_1222() : void
      {
         if(this.var_2051)
         {
            this.var_2050 = true;
         }
         else
         {
            this.method_2134();
         }
      }
      
      private function method_2134() : void
      {
         this.var_2050 = false;
         Model.object = this.name_700;
         this.server.method_2130();
         Model.method_38();
      }
      
      public function close() : void
      {
         this.name_700 = null;
         this.server = null;
         this.var_540.method_2133();
         this.var_540 = null;
      }
   }
}
