package package_360
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.name_1072;
   import flash.media.Sound;
   import package_159.name_1594;
   
   public class name_1715
   {
       
      
      private var var_2473:name_1072;
      
      private var var_2471:name_1072;
      
      private var var_2472:TextureMaterial;
      
      public var name_1721:Sound;
      
      public var name_1726:Vector.<name_1594>;
      
      public var name_1734:Vector.<name_1594>;
      
      public var name_1724:Number;
      
      public function name_1715()
      {
         super();
      }
      
      public function method_1238(param1:Boolean) : name_1072
      {
         return this.var_2473;
      }
      
      public function method_1236(param1:Boolean) : name_1072
      {
         return this.var_2471;
      }
      
      public function name_2701() : TextureMaterial
      {
         return this.var_2472;
      }
      
      public function set name_1725(param1:name_1072) : void
      {
         this.var_2473 = param1;
      }
      
      public function set name_1727(param1:name_1072) : void
      {
         this.var_2471 = param1;
      }
      
      public function set method_2485(param1:TextureMaterial) : void
      {
         this.var_2472 = param1;
      }
      
      public function name_1730() : Array
      {
         return [this.var_2473.material,this.var_2471.material,this.var_2472];
      }
   }
}
