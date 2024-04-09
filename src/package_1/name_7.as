package package_1
{
   import alternativa.osgi.OSGi;
   import flash.text.Font;
   import flash.text.TextFormat;
   import package_11.IBundleActivator;
   import var_5.name_269;
   
   public class name_7 implements IBundleActivator
   {
      
      private static const const_18:Class = name_268;
       
      
      public function name_7()
      {
         super();
      }
      
      public static function init() : void
      {
         Font.registerFont(const_18);
         var _loc1_:TextFormat = new TextFormat("MyriadPro",12,false);
         _loc1_.color = 16777215;
         name_269.setTextFormat(_loc1_,true);
      }
      
      public function start(param1:OSGi) : void
      {
         Font.registerFont(const_18);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
