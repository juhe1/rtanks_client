package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.chat.name_1632;
   import alternativa.tanks.model.ChatModel;
   import alternativa.tanks.services.NewsServiceImpl;
   import alternativa.tanks.services.name_363;
   import alternativa.tanks.utils.Antiflood;
   import package_11.name_23;
   import package_120.name_408;
   import package_14.name_36;
   import package_339.name_400;
   import package_54.name_102;
   import package_7.name_32;
   import package_95.name_298;
   
   public class name_372 implements name_23
   {
      
      public static var osgi:OSGi;
       
      
      public var name_332:ChatModel;
      
      public function name_372()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         name_372.osgi = param1;
         Main.method_7("ChatModel init");
         var _loc2_:name_32 = param1.name_6(name_32) as name_32;
         param1.name_40(name_102,name_1632,"localeService");
         param1.name_40(name_36,ChatModel,"clientLog");
         param1.name_40(name_408,ChatModel,"userInfoService");
         param1.name_1(name_363,new NewsServiceImpl());
         param1.name_40(name_298,NewsServiceImpl,"storageService");
         this.name_332 = new ChatModel();
         param1.name_1(name_400,this.name_332);
         _loc2_.add(this.name_332);
         param1.name_40(name_36,Antiflood,"clientLog");
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.name_6(name_32) as name_32;
         _loc2_.remove(this.name_332.id);
         this.name_332 = null;
         name_372.osgi = null;
      }
   }
}
