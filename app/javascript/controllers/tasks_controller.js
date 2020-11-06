import ApplicationController from './application_controller'

export default class extends ApplicationController {

  sort(event) {
    let element = document.getElementById('tasks-list')
    let task_elements = document.getElementsByClassName('task-item')
    let tasks = Array.from(task_elements).map((task, index) => {
      return { id: task.dataset.taskId, position: (index +1)}
    })
    element.dataset.tasks = JSON.stringify(tasks)
    this.stimulate('TasksReflex#sort', element)
  }

}
