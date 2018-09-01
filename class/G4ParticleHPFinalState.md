<!-- G4ParticleHPFinalState.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 23:42:27 2018 (+0800)
;; Last-Updated: 六 9月  1 23:47:09 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPFinalState


```
#ifdef G4PHPDEBUG
	getenv("G4ParticleHPDebug")
```

## class

```cpp
public:

  G4ParticleHPFinalState()
  { 
    hasFSData = true; 
    hasXsec = true;
    hasAnyData = true;
    theBaseZ = 0;
    theBaseA = 0;
    theBaseM = 0;

    theNDLDataZ = 0;
    theNDLDataA = 0;
    theNDLDataM = 0;

     adjustResult = true;
     if ( getenv( "G4PHP_DO_NOT_ADJUST_FINAL_STATE" ) ) adjustResult = false;

     theProjectile = G4Neutron::Neutron();

     theResult.Put( NULL );

  };
  
  virtual ~G4ParticleHPFinalState(){};

  //virtual void Init (G4double A, G4double Z, G4String & dirName, G4String & aFSType) = 0;
  void Init (G4double A, G4double Z, G4String & dirName, G4String & aFSType, G4ParticleDefinition* projectile) { G4int M = 0; Init ( A, Z, M, dirName, aFSType,const_cast<G4ParticleDefinition*>(projectile)); };
  virtual void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* ) =0;
  virtual G4HadFinalState * ApplyYourself(const G4HadProjectile & ) 
  {
    throw G4HadronicException(__FILE__, __LINE__, "G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack) needs implementation");
    return 0;
  };
  
  // of course this would better be Done templating G4ParticleHPChannel..., 
  // but due to peculiarities of the DEC compiler, this way it
  // is easier to maintain.
  virtual G4ParticleHPFinalState * New() = 0;
  
  G4bool HasXsec() {return hasXsec;};
  G4bool HasFSData() {return hasFSData;};
  G4bool HasAnyData() {return hasAnyData;};
  
  virtual G4double GetXsec(G4double ) { return 0; };
  virtual G4ParticleHPVector * GetXsec() { return 0; };
  
  void     SetA_Z(G4double anA, G4double aZ, G4int aM=0) {theBaseA = anA; theBaseZ = aZ; theBaseM=aM; };
  G4double GetZ() { return theBaseZ; };
  G4double GetN() { return theBaseA; };
  G4double GetA() { return theBaseA; }; 
  G4int GetM() { return theBaseM; };

  void SetAZMs(G4double anA, G4double aZ, G4int aM, G4ParticleHPDataUsed used) 
  { theBaseA = anA; theBaseZ = aZ; theBaseM=aM; 
    theNDLDataA=(G4int)used.GetA(); theNDLDataZ=(G4int)used.GetZ(); theNDLDataM=used.GetM(); };
  
  void SetProjectile( G4ParticleDefinition* projectile ) {
    theProjectile = projectile; }

protected:
  
  G4bool hasXsec;
  G4bool hasFSData;
  G4bool hasAnyData;
  G4ParticleHPNames theNames;
  
  //G4HadFinalState theResult;
  G4Cache< G4HadFinalState* > theResult;

  
  G4double theBaseA;
  G4double theBaseZ;
  G4int theBaseM;

//080721
   protected:
      void adjust_final_state ( G4LorentzVector );
      G4bool DoNotAdjustFinalState(){ return !G4ParticleHPManager::GetInstance()->GetDoNotAdjustFinalState(); };
      G4int theNDLDataZ;
      G4int theNDLDataA;
      G4int theNDLDataM;

   private:
      G4bool adjustResult;

protected:
  G4ParticleDefinition* theProjectile;
```

<!-- G4ParticleHPFinalState.md ends here -->
