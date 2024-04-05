package package_166
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.engine3d.name_1072;
   import flash.media.Sound;
   
   public class name_1772
   {
       
      
      public var name_1788:name_1072;
      
      public var idleSound:Sound;
      
      public var name_1783:name_1072;
      
      public var name_1778:name_1072;
      
      private var var_2504:TextureMaterial;
      
      public var name_1785:Sound;
      
      public var name_1780:name_1072;
      
      public var name_1782:name_1072;
      
      private var var_2505:TextureMaterial;
      
      public var name_1787:Sound;
      
      public function name_1772()
      {
         super();
      }
      
      public function set name_1777(param1:TextureMaterial) : void
      {
         this.var_2504 = param1;
      }
      
      public function set name_1784(param1:TextureMaterial) : void
      {
         this.var_2505 = param1;
      }
      
      public function method_2498() : TextureMaterial
      {
         return this.var_2504;
      }
      
      public function method_2499() : TextureMaterial
      {
         return this.var_2505;
      }
      
      public function name_1730() : Array
      {
         return [this.name_1788.material,this.name_1783.material,this.var_2504,this.name_1780.material,this.var_2505];
      }
   }
}
