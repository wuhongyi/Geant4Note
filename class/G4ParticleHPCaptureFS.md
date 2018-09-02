<!-- G4ParticleHPCaptureFS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 9月  2 10:23:01 2018 (+0800)
;; Last-Updated: 日 9月  2 10:26:44 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ParticleHPCaptureFS

**public G4ParticleHPFinalState**

读取高精度参数

```cpp
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* );
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
```

- "/FSMF6"
- "/FS"



## class

```cpp
  public:
  
  G4ParticleHPCaptureFS()
  {
    hasXsec = false; 
    hasExactMF6 = false;
    targetMass = 0;
  }
  
  ~G4ParticleHPCaptureFS()
  {
  }
  
  void Init (G4double A, G4double Z, G4int M, G4String & dirName, G4String & aFSType, G4ParticleDefinition* );
  G4HadFinalState * ApplyYourself(const G4HadProjectile & theTrack);
  G4ParticleHPFinalState * New() 
  {
   G4ParticleHPCaptureFS * theNew = new G4ParticleHPCaptureFS;
   return theNew;
  }
  
  private:
  
  G4double targetMass;
  
  G4ParticleHPPhotonDist theFinalStatePhotons;

   G4ParticleHPEnAngCorrelation theMF6FinalState;
   G4bool hasExactMF6;
  
  G4ParticleHPNames theNames;
  
```

<!-- G4ParticleHPCaptureFS.md ends here -->
