# OpenQA script launcher

This Repo simplify the work to QA engineers using openQA. 
This launch a container providing you all the openQA scripts
to launch jobs

## Start-up

1. Clone client.conf.template as client.conf and configure all the openQA services you need with a valid URL, key and secret.

2. Build your container ```docker-compose build```

3. Run the container ```docker-compose run -d```

## Usage

### Clone a job

#### Calling to the container scripts

```
docker-compose exec console /usr/share/openqa/script/clone-job.ps \
https://openqa.opensuse.org/tests/170766 \
--clone-job-args="--host openqa.opensuse.org"
```

#### Using top-level scripts

```
./clone-job.sh \
openqa.opensuse.org \
https://openqa.opensuse.org/tests/1706491
```

### Execute a git repository test

#### Calling to the container scripts

```
docker-compose exec console /usr/share/openqa/script/openqa-clone-custom-git-refspec 
https://github.com/os-autoinst/os-autoinst-distri-openQA/pull/67 \
https://openqa.opensuse.org/tests/1706491 \
--clone-job-args="--host openqa.opensuse.org"
```

#### Using top-level scripts

```
./openqa-clone-custom-git.sh \
openqa.opensuse.org \
https://github.com/os-autoinst/os-autoinst-distri-openQA/pull/67 \
https://openqa.opensuse.org/tests/1706491
```

### Use openqa-cli

```
docker-compose exec console openqa-cli api --host openqa.opensuse.org /jobs limit=1000 latest=1 state="done"
```