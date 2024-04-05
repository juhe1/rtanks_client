package package_68
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import flash.utils.Dictionary;
   
   public class Object3DContainerProxy implements name_175
   {
       
      
      private var var_170:Object3DContainer;
      
      private const objects:Dictionary = new Dictionary();
      
      public function Object3DContainerProxy(param1:Object3DContainer = null)
      {
         this.var_170 = new Object3DContainer();
         super();
         this.name_1239(param1);
      }
      
      public function addChild(param1:Object3D) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         this.objects[param1] = true;
         this.var_170.addChild(param1);
      }
      
      public function addChildAt(param1:Object3D, param2:int) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         this.objects[param1] = true;
         this.var_170.addChildAt(param1,param2);
      }
      
      public function method_1870(param1:Vector.<Object3D>) : void
      {
         var _loc2_:Object3D = null;
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         for each(_loc2_ in param1)
         {
            this.addChild(_loc2_);
         }
      }
      
      public function removeChild(param1:Object3D) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(Boolean(this.objects[param1]))
         {
            delete this.objects[param1];
            this.var_170.removeChild(param1);
         }
      }
      
      public function name_1239(param1:Object3DContainer) : void
      {
         var _loc2_:Vector.<Object3D> = this.method_1455();
         this.var_170 = param1 || new Object3DContainer();
         this.method_1870(_loc2_);
      }
      
      private function method_1455() : Vector.<Object3D>
      {
         var _loc1_:* = undefined;
         var _loc2_:Vector.<Object3D> = new Vector.<Object3D>();
         for(_loc1_ in this.objects)
         {
            delete this.objects[_loc1_];
            this.var_170.removeChild(_loc1_);
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
   }
}
