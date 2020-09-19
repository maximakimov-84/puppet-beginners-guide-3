#!/bin/bash
vagrant plugin install vagrant-vbguest
vagrant vbguest --do install --no-cleanup
vagrant up
