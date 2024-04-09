package package_156
{
   import alternativa.model.IModel;
   import package_13.Long;
   import package_366.ICrystalBonusModelBase;
   import package_366.CrystalBonusModelBase;
   import package_4.ClientObject;
   
   public class CrystalBonusModel extends CrystalBonusModelBase implements ICrystalBonusModelBase
   {
       
      
      public function CrystalBonusModel()
      {
         super();
         _interfaces.push(IModel,ICrystalBonusModelBase);
      }
      
      public function activated(param1:ClientObject, param2:Long, param3:int) : void
      {
      }
   }
}
