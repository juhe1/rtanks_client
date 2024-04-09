package package_181
{
   import alternativa.model.IModel;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_13.Long;
   import package_386.class_129;
   import package_386.class_131;
   import package_4.ClientObject;
   
   public class BannerModel extends class_131 implements class_129, class_130
   {
       
      
      private var var_1129:Dictionary;
      
      private var url:Dictionary;
      
      public function BannerModel()
      {
         super();
         _interfaces.push(IModel,class_129,class_130);
         this.var_1129 = new Dictionary();
         this.url = new Dictionary();
      }
      
      public function initObject(param1:ClientObject, param2:Long, param3:String) : void
      {
         Main.method_8("BannerModel","initObject resourceID: %1, url: %2",param2,param3);
         this.url[param1] = param3;
         this.var_1129[param1] = null;
      }
      
      public function method_1366(param1:ClientObject) : BitmapData
      {
         return this.var_1129[param1];
      }
      
      public function method_1365(param1:ClientObject) : String
      {
         return this.url[param1];
      }
      
      public function method_1367(param1:ClientObject) : void
      {
         Main.method_8("BannerModel","click   bannerObjectId: %1",param1.id);
      }
   }
}
