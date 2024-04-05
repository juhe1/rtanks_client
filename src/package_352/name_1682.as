package package_352
{
   import alternativa.engine3d.core.Object3D;
   
   public class name_1682
   {
       
      
      public var object:Object3D;
      
      private var var_2425:int;
      
      public function name_1682(param1:int)
      {
         super();
         this.var_2425 = param1;
      }
      
      public function get type() : int
      {
         return this.var_2425;
      }
      
      public function traceProp() : void
      {
         trace(this.object);
      }
   }
}
