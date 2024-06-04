window.addEventListener("message", (e) => {
    let data = e.data;
    switch(data.action) {
        case 'OpenUI':
            $('.umneployed').html(`
            <span style="font-size: 1rem; opacity: 0.9; font-weight: 600; color: white; font-family: poppins, sans-serif;">Po Naciśnięciu Tego przycisku staniesz sie bezrobotny</span>
            <button id="setjob" onclick="SetJob('${data.unemployed.name}', ${data.unemployed.grade})">Zwolnij Się</button>`);
            $('.job_box').empty();
            for (const [job, jobData] of Object.entries(data.jobs)) {
                $('.job_box').append(`<div class="job">
                <span id="jobname" style="font-size: 2rem"><i class="${jobData.icon}"></i> ${jobData.label}</span>
                <span>Zarobki:<span id="jobearn" style="font-weight: 800"> ${jobData.payout}$</span></span>
                <span>Opis Pracy:<span id="jobdesc" style="font-weight: 800"> ${jobData.desc}</span>
                </span>
                <button id="setjob" onclick="SetJob('${job}', ${jobData.grade})">Zatrudnij Się</button>
                </div>`);
            }
            $('body').show();
            break;
    }
})

function CloseUI() {
    $('body').hide();
    $.post('https://ls-jobcenter/CloseUI');
}

document.onkeydown = ((e) => {
    if (e.which == 27) {
        CloseUI();
    }
})

const SetJob = ((job, grade) => {
    $.post('https://ls-jobcenter/SetJob', JSON.stringify({job: job, grade: grade}));
    CloseUI();
})