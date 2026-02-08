# Customization

Features and differences from other frameworks, plugins and agentic orcestrators.

## Token usage and Efficiency

Main limitation of this workflow is amount of tokens that you willing to spend on each task.

In contradition to other plugins in context-engineering-kit marketplace, this plugin tries to use as much tokens as possible in order to get best results. Such approach can eat all claude code session token for a single task, this is why it have default limits like `target-quality` and `max-iterations` set per each command. They are predefined in a way that if task defined well enough and not too big, in majority of the cases results will be so good, that you not will be need to re-iterate on it.

But if you want to get better results or make task done faster, you can adjust parameters of the commands. For example by adding params like `--target-quality 4.5 --max-iterations 5` to `/plan` or `/implement` command will allow orcestrator agent to iterate more in order to get close to "ideal" results. On the other hand you can set them to `--target-quality 3.0 --max-iterations 1`. This way agents will finish their work when quality of results at least minimally meets the criteria, and if not, it will iterate just once to resolve the issues. This way you can configure each command to balance between quality and speed per task run.

If you want just get results as fast as framework can produce them, you can use `--fast` preset in `/plan` command. It will limit amount of steps, decrease target quality and amount of refinement iterations all together. Decreasing quality even more, probably not will be worth it.

But on the other hand, if you know that you not need some steps in order to get task done, you can use `--skip` parameter in `/plan` command to skip them. For example, if you know that you not need to make any documentation research, you can write `--skip research`, which will skip research phase entaerly. Or if you know that you not need to parallaize your task implementation, you can write `--skip parallelize`.

As last, but not least, you can ask orcestrator to use only `haiku` model for all agents. It can sound not so relaible, but MAKER paper research have found that if you parallel all work for multiple smaller models, 3-10 per task, you can expect to get results that can be as good as bigger models. This approach not was tested or supported in this plugin yet, but it still can be working. You can try to combine `haiku` with bigger amount of `max-iterations` and `target-quality` to get results faster, but still with acceptable quality.

## Human-in-the-loop verification

Initial version of this plugin was designed to produce highest possible quality of solution that LLM model can produce, or in another terms move LLM real world usage closer to benchmarks that it was able to achieve. But in real life scenario LLMs tend to move towards sub-optimal solutions, which is not what we usally want to achieve. Current version of plugin was able to filter out all not working solutions, and obviusly incorrect. But overall quality of solution still depends on quality of speficiation file and as a result on quality of review that you make for speficiation.

## Epics, User Stories and Roadmaps

This plugin follows princeple of KISS (Keep It Simple Stupid) to avoid adding unnecessary complexity. So it not yet support epics and roadmaps, because it currently problematic to keep model focused on such long term activities out of the box. But it already possible to reach simular results by using `/add-task` command with specifying dependencies between tasks. This way you can produce naturally hierarchial structure of tasks that builds into roadmap.

On top of that you can manage and define own process to organaize tasks that more suitable for you and your team. You can write own prompts that will collect tasks into epics or decompose existing epics into multiple smaller tasks.
