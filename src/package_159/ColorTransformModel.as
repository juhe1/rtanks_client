package package_159
{
   import alternativa.model.IModel;
   import package_361.class_81;
   import package_361.class_82;
   import package_4.ClientObject;
   
   public class ColorTransformModel extends class_81 implements class_82, name_1737
   {
       
      
      public function ColorTransformModel()
      {
         super();
         _interfaces.push(IModel,name_1737);
      }
      
      public function initObject(param1:ClientObject, param2:Array) : void
      {
         var _loc3_:uint = param2.length;
         var _loc4_:Vector.<name_1594> = new Vector.<name_1594>(_loc3_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = new name_1594(param2[_loc5_]);
            _loc5_++;
         }
         param1.method_12(ColorTransformModel,_loc4_);
      }
      
      public function name_1738(param1:ClientObject) : Vector.<name_1594>
      {
         return Vector.<name_1594>(param1.method_16(ColorTransformModel));
      }
   }
}
