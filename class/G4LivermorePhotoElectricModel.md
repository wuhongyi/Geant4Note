<!-- G4LivermorePhotoElectricModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:52:57 2018 (+0800)
;; Last-Updated: 六 7月 14 12:58:45 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4LivermorePhotoElectricModel

**public G4VEmModel**

- G4ElementData
- "/livermore/phot_epics2014/pe-cs-x.dat"
- "/livermore/phot_epics2014/pe-high-x.dat"
- "/livermore/phot_epics2014/pe-low-x.dat"
- "/livermore/phot_epics2014/pe-ss-cs-x.dat"
- "/livermore/phot_epics2014/pe-le-cs-x.dat"




## class

```cpp
public:
    
    G4LivermorePhotoElectricModel(const G4String& nam = "LivermorePhElectric");
    
    virtual ~G4LivermorePhotoElectricModel();
    
    virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);
    
    virtual G4double CrossSectionPerVolume(const G4Material*,
                                           const G4ParticleDefinition*,
                                           G4double energy,
                                           G4double cutEnergy = 0.0,
                                           G4double maxEnergy = DBL_MAX);
    
    virtual G4double ComputeCrossSectionPerAtom(
                                                const G4ParticleDefinition*,
                                                G4double energy,
                                                G4double Z,
                                                G4double A=0,
                                                G4double cut=0,
                                                G4double emax=DBL_MAX);
    
    virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
                                   const G4MaterialCutsCouple*,
                                   const G4DynamicParticle*,
                                   G4double tmin,
                                   G4double maxEnergy);
    
    
    virtual void InitialiseForElement(const G4ParticleDefinition*, G4int Z);
    
    inline void SetLimitNumberOfShells(G4int);
    G4double GetBindingEnergy (G4double ZZ, G4int shell);
    
    G4LivermorePhotoElectricModel & operator=
    (const G4LivermorePhotoElectricModel &right) = delete;
    G4LivermorePhotoElectricModel(const G4LivermorePhotoElectricModel&) = delete;


private:
    
    void ReadData(G4int Z, const char* path = nullptr);
```


<!-- G4LivermorePhotoElectricModel.md ends here -->
