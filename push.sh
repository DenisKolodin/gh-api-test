#!/usr/bin/bash

TAG=$(gh release list -R rustinsight-lab/ri-learn | grep "Latest" | cut -f1)
git commit --allow-empty -m "Release $TAG"
git tag $TAG
git push origin $TAG
gh release download -R rustinsight-lab/ri-learn $TAG
gh release create $TAG
gh release upload $TAG ri-learn*
rm ri-learn*
