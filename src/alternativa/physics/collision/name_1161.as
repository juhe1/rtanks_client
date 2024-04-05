package alternativa.physics.collision
{
   import package_61.name_767;
   
   public class name_1161
   {
       
      
      public var indices:Vector.<int>;
      
      public var var_1989:Vector.<int>;
      
      public var name_1177:name_767;
      
      public var parent:name_1161;
      
      public var name_1165:CollisionKdTree2D;
      
      public var axis:int = -1;
      
      public var coord:Number;
      
      public var name_1163:name_1161;
      
      public var name_1162:name_1161;
      
      public function name_1161()
      {
         super();
      }
      
      public function destroy() : void
      {
         if(Boolean(this.name_1163))
         {
            this.name_1163.destroy();
            this.name_1163 = null;
         }
         if(Boolean(this.name_1162))
         {
            this.name_1162.destroy();
            this.name_1162 = null;
         }
         if(Boolean(this.name_1165))
         {
            this.name_1165.destroyTree();
            this.name_1165 = null;
         }
         this.parent = null;
         this.name_1177 = null;
         this.indices = null;
         this.var_1989 = null;
      }
   }
}
