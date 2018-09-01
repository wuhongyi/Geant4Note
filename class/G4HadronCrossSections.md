<!-- G4HadronCrossSections.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 09:14:40 2018 (+0800)
;; Last-Updated: 六 9月  1 09:22:30 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4HadronCrossSections

- This class encapsulates cross section data and interpolations from the Geant3/Gheisha routine GHESIG.
- The overloaded method MakePhysicsVector can be used to Generate Physics Tables for different processes.
- Note: this is implemented as a SINGLETON class


**截面数据参数在cc文件中**


## class

```cpp
enum { TSIZE=41, NPARTS=35, NELAB=17, NCNLW=15, NFISS=21 };
```

```cpp
  public:

    G4HadronCrossSections();

    ~G4HadronCrossSections();

    static G4HadronCrossSections* Instance();

    G4bool IsApplicable(const G4DynamicParticle* aParticle);

    G4double GetElasticCrossSection(const G4DynamicParticle*,
                                    G4int /*ZZ*/, G4int /*AA*/);

    G4double GetInelasticCrossSection(const G4DynamicParticle*,
                                      G4int /*ZZ*/, G4int /*AA*/);

    G4double GetCaptureCrossSection(const G4DynamicParticle*, G4int /*Z*/);

    G4double GetFissionCrossSection(const G4DynamicParticle*, G4int /*ZZ*/,
                                    G4int /*AA*/);

  /*
    static void SetCorrectInelasticNearZero(G4bool value)
      {correctInelasticNearZero = value;}

    static G4bool GetCorrectInelasticNearZero()
      {return correctInelasticNearZero;}
  */

    void SetVerboseLevel(G4int value) {verboseLevel = value;}

    G4int GetVerboseLevel() {return verboseLevel;}

  private:

    G4int GetParticleCode(const G4DynamicParticle*);

    void CalcScatteringCrossSections(const G4DynamicParticle*, 
                                     G4int /*ZZ*/, G4int /*AA*/);

    static G4ThreadLocal G4HadronCrossSections* theInstance;

    G4Pow* g4pow;

    G4double sigelastic;
    G4double siginelastic;
    G4ParticleDefinition* prevParticleDefinition;
//    G4Element* prevElement;
    G4int prevZZ;
    G4int prevAA;
    G4double prevKineticEnergy;
    G4double lastEkx, lastEkxPower;

    G4bool correctInelasticNearZero;

    G4int verboseLevel;

    // The following arrays are declared static to allow the use of initializers.  
    // They are initialized in G4HadronCrossSections.cc, thus providing some 
    // data hiding.

    static const G4float plab[TSIZE];
    static const G4float csel[NPARTS][TSIZE];
    static const G4float csin[NPARTS][TSIZE];

    static const G4float cspiel[3][TSIZE];
    static const G4float cspiin[3][TSIZE];

    static const G4float cspnel[3][TSIZE];
    static const G4float cspnin[3][TSIZE];

    static const G4float elab[NELAB];
    static const G4float cnlwat[NCNLW], cnlwel[NCNLW][NELAB], cnlwin[NCNLW][NELAB];

    static const G4float cscap[100];

    static const G4float ekfiss[NFISS], csfiss[4][NFISS];

    static const G4float alpha[NPARTS], alphac[TSIZE];

    static const G4float partel[35], partin[35];
    static const G4int   icorr[35], intrc[35];

    static const G4float csa[4];
    static const G4int ipart2[7];
```

<!-- G4HadronCrossSections.md ends here -->
