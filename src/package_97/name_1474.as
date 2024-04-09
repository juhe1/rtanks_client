package package_97
{
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.physics.Body;
   import alternativa.physics.name_888;
   import alternativa.physics.name_889;
   import alternativa.tanks.battle.name_712;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import package_277.name_904;
   import package_37.Matrix3;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_42.name_73;
   
   public class name_1474 implements name_712
   {
       
      
      private var bonus:ParaBonus;
      
      private var const_1887:name_904;
      
      private var var_121:BattlefieldModel;
      
      public function name_1474(param1:ParaBonus)
      {
         super();
         this.bonus = param1;
         var _loc2_:Number = name_1460.name_1463;
         this.const_1887 = new name_904(new Vector3(_loc2_,_loc2_,_loc2_),name_73.name_148,name_888.name_947);
      }
      
      public function activate(param1:BattlefieldModel) : void
      {
         if(this.var_121 == null)
         {
            this.var_121 = param1;
            param1.method_180(this);
         }
      }
      
      public function deactivate() : void
      {
         if(this.var_121 != null)
         {
            this.var_121.method_173(this);
            this.var_121 = null;
         }
      }
      
      public function update(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Matrix4 = this.const_1887.transform;
         _loc7_.name_943(param1,param2,param3,param4,param5,param6);
         this.const_1887.calculateAABB();
      }
      
      public function method_2340(param1:Vector3, param2:Matrix3) : void
      {
         var _loc3_:Matrix4 = this.const_1887.transform;
         _loc3_.setFromMatrix3(param2,param1);
         this.const_1887.calculateAABB();
      }
      
      public function method_1636(param1:Body) : void
      {
         var _loc2_:CollisionPrimitive = null;
         var _loc3_:name_889 = param1.var_302.head;
         while(_loc3_ != null)
         {
            _loc2_ = _loc3_.name_899;
            if(this.var_121.var_117.name_247.method_698(_loc2_,this.const_1887))
            {
               this.bonus.method_1025();
               return;
            }
            _loc3_ = _loc3_.next;
         }
      }
   }
}
