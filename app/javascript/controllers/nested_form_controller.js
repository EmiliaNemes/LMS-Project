import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ["add_answer", "template"]

    add_association(event){
        window.alert("HERREE")
        event.preventDefault()
        var content = this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random()))
        this.add_answerTarget.insertAdjacentHTML('beforebegin', content)
    }

    remove_association(event){
        event.preventDefault()
        let item = event.targets.closest(".nested-fields")
        item.querySelector("input[name*='_destroy']").value = 1
        item.style.display = 'none'
    }
}