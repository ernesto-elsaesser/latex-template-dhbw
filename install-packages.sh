#!/bin/sh

MGR='sudo tlmgr'

$MGR update --self
$MGR install texfot setspace geometry footmisc listings hyperref xurl apalike-german glossaries natbib
