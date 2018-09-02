<!-- G4ParticleHPElasticFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:03:44 2018 (+0800)
;; Last-Updated: 日 9月  2 10:06:57 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4ParticleHPElasticFS

**public G4ParticleHPFinalState**

**读取高精度数据参数**

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

- G4ParticleHPLegendreStore
- "/FS"

## class

```cpp
  public:
  
  G4ParticleHPElasticFS()
  {
    hasXsec = false; 
    theCoefficients = 0;
    theProbArray = 0;
    
    repFlag = 0;
    tE_of_repFlag3 = 0.0;
    targetMass = 0.0;
    frameFlag = 0;
  }
  ~G4ParticleHPElasticFS()
  {
    if(theCoefficients!=0) delete theCoefficients;
    if(theProbArray!=0) delete theProbArray;
  }
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition*);
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPElasticFS * theNew = new G4ParticleHPElasticFS;
   return theNew;
  }
  
  private:
  G4int repFlag;    // Legendre coeff(1), or probability array(2), or isotropic(0).
                    // add 3: for Legendre (Low Energy) + Probability (High Energy)
  G4double tE_of_repFlag3; // transition energy in case of  repFlag 3:
  G4double targetMass; // in neutronmass units.
  G4int frameFlag;  // CMS or Lab system.
  
  G4ParticleHPLegendreStore * theCoefficients; // the legendre coefficients
  G4ParticleHPPartial * theProbArray; // the probability array p,costh for energy
  G4ParticleHPInterpolator theInt; // interpolation
  
  G4ParticleHPFastLegendre theLegend; // fast look-up for leg-integrals
```

<!-- G4ParticleHPElasticFS.md ends here -->
