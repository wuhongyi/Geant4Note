<!-- G4VCascadeCollider.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 9月  1 11:03:34 2018 (+0800)
;; Last-Updated: 六 9月  1 11:04:09 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VCascadeCollider


## class

```cpp
public:
  G4VCascadeCollider(const G4String& name, G4int verbose=0);

  virtual ~G4VCascadeCollider() {}

  virtual void collide(G4InuclParticle* bullet, G4InuclParticle* target,
		       G4CollisionOutput& output) = 0;

  virtual void setVerboseLevel(G4int verbose=0) { verboseLevel=verbose; }

protected:
  G4String theName;
  G4int verboseLevel;

  virtual void setName(const G4String& name) { theName = name; }

private:
  // Copying of modules is forbidden
  G4VCascadeCollider(const G4VCascadeCollider&);
  G4VCascadeCollider& operator=(const G4VCascadeCollider&);
```

<!-- G4VCascadeCollider.md ends here -->
