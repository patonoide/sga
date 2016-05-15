var populateTable = function(data) {

  table_div = $('#records');
  table_div.empty();

  if (data.length == 0) {

    var alert = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>&nbsp;&nbsp;Não há atas para o núcleo selecionado.</div>';
    table_div.append(alert);
    table_div.hide().fadeIn('slow');

  }

  else {

    var table = $('<table id="records-table"></table>').addClass('table');
    var thead = '<thead><tr><th>Status</th><th>Número</th><th>Data</th><th></th></tr></thead>';

    table.append(thead)

    for (var i = 0; i < data.length; i++) {

      var row = $('<tr></tr>');

      if (data[i].discussion || data[i].records_users.length == 0) {
        var status = '<td><div class="label label-success">Completa</div></td>';
      }

      else {
        var status = '<td><div class="label label-danger">Incompleta</div></td>';
      }

      row.append(status);

      var content = '<td>' + data[i].number + '</td><td>' + data[i].date + '</td>';
      var link = "<td align='right'><a href=/records/" + data[i].id + ">Visualizar Ata</a></td>";

      row.append(content);
      row.append(link);
      table.append(row);

    }

    table_div.append(table);

    table.DataTable({
      'dom': '<"top">rt<"pull-left spacing"f><"pull-right spacing"p><"clear">',
      "language": { "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Portuguese.json"},
      responsive: true
    });

  }
}

var selectSectorAndPopulateTable = function(sector_id) {
  $.ajax('/sectors/' + sector_id + '/records.json', {
    success: function(data) {
      populateTable(data);
    },
    error: function(data) {
      console.log(data);
    }
  });
}

$('document').ready(function() {
  $('#sector-select').on('change', function() {
    sector_id = $('#sector-select').val();
    if (sector_id) {
      selectSectorAndPopulateTable(sector_id);
    }
  });
});
