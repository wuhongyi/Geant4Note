<!-- G4ParticleHPJENDLHEData.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:01:03 2018 (+0800)
;; Last-Updated: 五 8月 10 07:01:43 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPJENDLHEData

**public G4VCrossSectionDataSet**

Cross-section data set for a high precision (based on JENDL_HE evaluated data libraries) description of elastic scattering 20 MeV ~ 3 GeV; 

## class

```cpp
   public:
   
   G4ParticleHPJENDLHEData();
   G4ParticleHPJENDLHEData( G4String , G4ParticleDefinition* );

   
   ~G4ParticleHPJENDLHEData();
   
   G4bool IsApplicable(const G4DynamicParticle*, const G4Element*);

   G4bool IsZAApplicable( const G4DynamicParticle* , G4double /*ZZ*/, G4double /*AA*/)
   { return false; }

   G4double GetCrossSection(const G4DynamicParticle*, const G4Element*, G4double aT);

   void BuildPhysicsTable(const G4ParticleDefinition&);

   void DumpPhysicsTable(const G4ParticleDefinition&);
   
   private:
   
      std::vector< G4bool > vElement;

      std::map< G4int , std::map< G4int , G4PhysicsVector* >* > mIsotope; 

      G4bool isThisInMap ( G4int , G4int );
      G4bool isThisNewIsotope ( G4int z , G4int a ) { return !( isThisInMap( z , a ) ); };
      G4PhysicsVector* readAFile ( std::fstream* );
      void registAPhysicsVector ( G4int , G4int , G4PhysicsVector* );

      G4double getXSfromThisIsotope ( G4int , G4int , G4double );

      G4String reactionName;
      G4String particleName;
```

<!-- G4ParticleHPJENDLHEData.md ends here -->
